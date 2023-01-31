import Map from "ol/Map.js";
import View from "ol/View.js";
import {
    Tile as TileLayer
} from 'ol/layer.js';
import OSM from "ol/source/OSM.js";
import Overlay from "ol/Overlay.js";
import TileWMS from 'ol/source/TileWMS.js';

document.addEventListener("alpine:init", () => {
    Alpine.data("map", function () {
        return {
            legendOpened: false,
            map: {},
            activeTab: 'legend',
            initComponent() {
                let monumentsLayer = new TileLayer({
                    source: new TileWMS({
                        url: 'http://localhost:8080/geoserver/wms',
                        params: {
                            'LAYERS': 'laravelgis:monuments',
                            'TILED': true
                        },
                        serverType: 'geoserver',
                    }),
                    label: 'Monuments',
                });

                let worldAdministrativeBoundariesLayer = new TileLayer({
                    source: new TileWMS({
                        url: 'http://localhost:8080/geoserver/wms',
                        params: {
                            'LAYERS': 'laravelgis:world-administrative-boundaries',
                            'TILED': true
                        },
                        serverType: 'geoserver',
                    }),
                    label: 'World Administrative Boundaries',
                });

                let worldRiversLayer = new TileLayer({
                    source: new TileWMS({
                        url: 'http://localhost:8080/geoserver/wms',
                        params: {
                            'LAYERS': 'laravelgis:world-rivers',
                            'TILED': true
                        },
                        serverType: 'geoserver',
                    }),
                    label: 'World Rivers',
                });

                this.map = new Map({
                    target: this.$refs.map,
                    layers: [
                        new TileLayer({
                            source: new OSM(),
                            label: 'OpenStreetMap',
                        }),
                        worldAdministrativeBoundariesLayer,
                        worldRiversLayer,
                        monumentsLayer
                    ],
                    view: new View({
                        projection: "EPSG:4326",
                        center: [-78.2161, -0.7022],
                        zoom: 8,
                    }),
                    overlays: [
                        new Overlay({
                            id: 'info',
                            element: this.$refs.popup,
                            stopEvent: true,
                        }),
                    ],
                });

                this.map.on("singleclick", (event) => {
                    if (event.dragging) {
                        return;
                    }

                    let overlay = this.map.getOverlayById('info')
                    overlay.setPosition(undefined)
                    this.$refs.popupContent.innerHTML = ''

                    const viewResolution = /** @type {number} */ (event.map.getView().getResolution())

                    const url = monumentsLayer.getSource().getFeatureInfoUrl(
                        event.coordinate,
                        viewResolution,
                        'EPSG:4326', {
                            'INFO_FORMAT': 'application/json'
                        })

                    if (url) {
                        fetch(url)
                            .then((response) => response.json())
                            .then((json) => {
                                if (json.features.length > 0) {
                                    this.gotoMonument(json.features[0])
                                }
                            });
                    }

                });
            },
            closePopup() {
                let overlay = this.map.getOverlayById('info')
                overlay.setPosition(undefined)
                this.$refs.popupContent.innerHTML = ''
            },
            gotoMonument(jsonFeature) {
                this.map.getView().animate({
                    center: jsonFeature.geometry.coordinates,
                    zoom: 15,
                    duration: 500,
                });

                let content =
                    '<h4 class="text-gray-500 font-bold">' +
                    jsonFeature.properties.name +
                    '</h4>'

                content +=
                    '<img src="' +
                    jsonFeature.properties.image +
                    '" class="mt-2 w-full max-h-[200px] rounded-md shadow-md object-contain overflow-clip">'

                this.$refs.popupContent.innerHTML = content

                setTimeout(() => {
                    this.map.getOverlayById('info').setPosition(
                        jsonFeature.geometry.coordinates
                    );
                }, 500)

            },
            hasLegend(layer) {
                return layer.getSource() instanceof TileWMS
            },
            legendUrl(layer) {
                if (this.hasLegend(layer)) {
                    return layer
                        .getSource()
                        .getLegendUrl(this.map.getView().getResolution(), {
                            LEGEND_OPTIONS: 'forceLabels:on'
                        })
                }
            }
        };
    });
});
