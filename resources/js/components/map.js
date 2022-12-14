import Map from "ol/Map.js";
import View from "ol/View.js";
import TileLayer from "ol/layer/Tile.js";
import VectorSource from "ol/source/Vector";
import VectorLayer from "ol/layer/Vector";
import OSM from "ol/source/OSM.js";
import { Style, Fill, Stroke, Circle, Text } from "ol/style.js";
import GeoJSON from "ol/format/GeoJSON";

document.addEventListener("alpine:init", () => {
    Alpine.data("map", function () {
        return {
            legendOpened: false,
            map: {},
            monumentsLayer: [],
            initComponent() {
                const paramsObj = {
                    servive: 'WFS',
                    version: '2.0.0',
                    request: 'GetFeature',
                    typeName: 'laravelgis:monuments',
                    outputFormat: 'application/json',
                    crs: 'EPSG:4326',
                    srsName: 'EPSG:4326',
                }

                const urlParams = new URLSearchParams(paramsObj)
                const monumentsUrl = 'http://localhost:8080/geoserver/wfs?' + urlParams.toString()

                this.monumentsLayer = new VectorLayer({
                    source: new VectorSource({
                        format: new GeoJSON(),
                        url: monumentsUrl,
                    }),
                    style: this.styleFunction,
                    label: "Monuments",
                })

                this.map = new Map({
                    target: this.$refs.map,
                    layers: [
                        new TileLayer({
                            source: new OSM(),
                            label: "OpenStreetMap",
                        }),
                        this.monumentsLayer,
                    ],
                    view: new View({
                        projection: "EPSG:4326",
                        center: [0, 0],
                        zoom: 2,
                    }),
                });

            },
            get monumentsFeatures() {
                return this.monumentsLayer.getSource().getFeatures()
            },
            styleFunction(feature, resolution) {
                return new Style({
                    image: new Circle({
                        radius: 4,
                        fill: new Fill({
                            color: "rgba(0, 255, 255, 1)",
                        }),
                        stroke: new Stroke({
                            color: "rgba(192, 192, 192, 1)",
                            width: 2,
                        }),
                    }),
                    text: new Text({
                        font: "12px sans-serif",
                        textAlign: "left",
                        text: feature.get("name"),
                        offsetY: -15,
                        offsetX: 5,
                        backgroundFill: new Fill({
                            color: "rgba(255, 255, 255, 0.5)",
                        }),
                        backgroundStroke: new Stroke({
                            color: "rgba(227, 227, 227, 1)",
                        }),
                        padding: [5, 2, 2, 5],
                    }),
                });
            },
            gotoFeature(feature) {
                this.map.getView().animate({
                    center: feature.getGeometry().getCoordinates(),
                    zoom: 10,
                    duration: 2000,
                });
            },
        };
    });
});