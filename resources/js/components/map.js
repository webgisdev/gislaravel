import Map from 'ol/Map.js';
import View from 'ol/View.js';
import TileLayer from 'ol/layer/Tile.js';
import Feature from 'ol/Feature';
import VectorSource from 'ol/source/Vector';
import VectorLayer from 'ol/layer/Vector';
import OSM from 'ol/source/OSM.js';
import Point from 'ol/geom/Point';
import { Style, Fill, Stroke, Circle, Text } from 'ol/style.js';
import { createProjection } from 'ol/proj';

document.addEventListener('alpine:init', () => {
    Alpine.data('map', function () {
        return {
            legendOpened: false,
            map: {},
            features: [
                new Feature({
                    geometry: new Point([2.2944960089681175, 48.85824068679814]),
                    name: 'Eiffel Tower',
                    yearly_visitors: 8810000,
                }),
                new Feature({
                    geometry: new Point([-74.04455265662958, 40.68928126997774]),
                    name: 'Statue of Liberty',
                    yearly_visitors: 4600000,
                }),
                new Feature({
                    geometry: new Point([12.492283213388305, 41.890266877448695]),
                    name: 'Rome Colosseum',
                    yearly_visitors: 3800000,
                }),
            ],
            init() {
                this.map = new Map({
                    target: this.$refs.map,
                    layers: [
                        new TileLayer({
                            source: new OSM(),
                            label: 'OpenStreetMap',
                        }),
                        new VectorLayer({
                            source: new VectorSource({
                                features: this.features,
                            }),
                            style: this.styleFunction,
                            label: 'Monuments',
                        })
                    ],
                    view: new View({
                        projection: 'EPSG:4326',
                        center: [0, 0],
                        zoom: 2,
                    }),
                })
            },
            styleFunction(feature) {
                let radius = Math.round(feature.get('yearly_visitors') / 1000000)

                let color = 'rgba(0, 255, 255, 0.5)'

                if(radius > 4) {
                    color = 'rgba(255, 255, 0, 0.5)'
                }

                if(radius > 5) {
                    color = 'rgba(255, 0, 0, 0.5)'
                }

                return new Style({
                    image: new Circle({
                        radius: radius,
                        fill: new Fill({
                            color: color,
                        }),
                        stroke: new Stroke({
                            color: 'rgba(192, 192, 192, 1)',
                            width: 2
                        }),
                    }),
                    text: new Text({
                        font: '12px sans-serif',
                        textAlign: 'left',
                        text: feature.get('name'),
                        offsetY: -15,
                        offsetX: 5,
                        backgroundFill: new Fill({
                            color: 'rgba(255, 255, 255, 0.5)',
                        }),
                        backgroundStroke: new Stroke({
                            color: 'rgba(227, 227, 227, 1)',
                        }),
                        padding: [5, 2, 2, 5]
                    })
                })
            }
        };
    });
});