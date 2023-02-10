import Map from "ol/Map.js";
import View from "ol/View.js";
import {
    Tile as TileLayer
} from 'ol/layer.js';
import OSM from "ol/source/OSM.js";
import Overlay from "ol/Overlay.js";
import TileWMS from 'ol/source/TileWMS.js';
import VectorSource from "ol/source/Vector.js";
import VectorLayer from "ol/layer/Vector.js";
import {
    Icon,
    Style,
} from "ol/style.js";
import {
    Draw,
} from "ol/interaction.js";

document.addEventListener("alpine:init", () => {
    Alpine.data("map", function () {
        return {
            legendOpened: false,
            map: {},
            activeTab: 'legend',
            monumentsLayer: {},
            draw: {},
            source: new VectorSource({}),
            mode: 'view',
            initComponent() {
                this.$watch('activeTab', (value) => {
                    this.stopDrawMonument()
                })

                this.draw = new Draw({
                    source: this.source,
                    type: 'Point',
                });

                this.monumentsLayer = new TileLayer({
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

                let drawLayer = new VectorLayer({
                    source: this.source,
                    style: new Style({
                        image: new Icon({
                            anchor: [0.5, 1],
                            anchorXUnits: 'fraction',
                            anchorYUnits: 'fraction',
                            src: '/img/location-marker.png',
                        }),
                    }),
                })

                this.map = new Map({
                    target: this.$refs.map,
                    layers: [
                        new TileLayer({
                            source: new OSM(),
                            label: 'OpenStreetMap',
                        }),
                        worldAdministrativeBoundariesLayer,
                        worldRiversLayer,
                        this.monumentsLayer,
                        drawLayer
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

                    const url = this.monumentsLayer.getSource().getFeatureInfoUrl(
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
                this.stopDrawMonument()

                this.map.getView().animate({
                    center: jsonFeature.geometry.coordinates,
                    zoom: 15,
                    duration: 500,
                });

                let content =
                    '<h4 class="text-gray-500 font-bold">' +
                    jsonFeature.properties.name +
                    '</h4>' +
                    '<p class="text-gray-400 text-xs italic">Created by ' +
                    jsonFeature.properties.user_name +
                    '</p>'

                let image = jsonFeature.properties.image || '/img/placeholder-image.png'
                content +=
                    '<img src="' +
                    image +
                    '" class="mt-2 w-full max-h-[200px] rounded-md shadow-md object-contain overflow-clip">'

                this.$refs.popupContent.innerHTML = content

                this.monumentsLayer.getSource().updateParams({
                    'TIMESTAMP': Date.now()
                })

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
            },
            startDrawMonument() {
                this.mode = "draw"

                this.draw.on("drawend", (e) => {
                    this.source.clear();
                });

                this.source.on("change", (e) => {
                    const features = this.source.getFeatures()

                    if (features.length === 1) {
                        const coordinates = features[0].getGeometry().getCoordinates()

                        this.$wire.set('coordinates', coordinates)

                        this.map.getView().animate({
                            center: coordinates,
                            duration: 500,
                        });
                    }
                });

                this.map.addInteraction(this.draw);
            },
            stopDrawMonument() {
                this.source.clear();

                this.map.removeInteraction(this.draw);

                this.mode = "view";
            }
        };
    });
});
