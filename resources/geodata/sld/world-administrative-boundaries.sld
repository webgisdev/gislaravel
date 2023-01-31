<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
    xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd"
    xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <NamedLayer>
        <Name>World administrative boundaries</Name>
        <UserStyle>
            <Title>World administrative boundaries</Title>
            <FeatureTypeStyle>
                <Rule>
                    <Title>Africa</Title>
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>continent</ogc:PropertyName>
                            <ogc:Literal>Africa</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                    </ogc:Filter>
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#15803d</CssParameter>
                            <CssParameter name="fill-opacity">0.1</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#15803d</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">Serif.plain</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                            <CssParameter name="font-style">bold</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#15803d</CssParameter>
                        </Fill>
                        <Halo>
                            <Radius>1.5</Radius>
                            <Fill>
                                <CssParameter name="fill">#FFFFFF</CssParameter>
                            </Fill>
                        </Halo>
                        <ogc:Geometry>
                            <ogc:Function name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </ogc:Geometry>
                        <LabelPlacement>
                            <PointPlacement>
                                <AnchorPoint>
                                    <AnchorPointX>0</AnchorPointX>
                                    <AnchorPointY>0</AnchorPointY>
                                </AnchorPoint>
                            </PointPlacement>
                        </LabelPlacement>
                    </TextSymbolizer>
                </Rule>
                <Rule>
                    <Title>Americas</Title>
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>continent</ogc:PropertyName>
                            <ogc:Literal>Americas</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                    </ogc:Filter>
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#b91c1c</CssParameter>
                            <CssParameter name="fill-opacity">0.1</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#b91c1c</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">Serif.plain</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                            <CssParameter name="font-style">bold</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#b91c1c</CssParameter>
                        </Fill>
                        <Halo>
                            <Radius>1.5</Radius>
                            <Fill>
                                <CssParameter name="fill">#FFFFFF</CssParameter>
                            </Fill>
                        </Halo>
                        <ogc:Geometry>
                            <ogc:Function name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </ogc:Geometry>
                        <LabelPlacement>
                            <PointPlacement>
                                <AnchorPoint>
                                    <AnchorPointX>0</AnchorPointX>
                                    <AnchorPointY>0</AnchorPointY>
                                </AnchorPoint>
                            </PointPlacement>
                        </LabelPlacement>
                    </TextSymbolizer>
                </Rule>
                <Rule>
                    <Title>Antarctica</Title>
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>continent</ogc:PropertyName>
                            <ogc:Literal>Antarctica</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                    </ogc:Filter>
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#1d4ed8</CssParameter>
                            <CssParameter name="fill-opacity">0.1</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#1d4ed8</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">Serif.plain</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                            <CssParameter name="font-style">bold</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#1d4ed8</CssParameter>
                        </Fill>
                        <Halo>
                            <Radius>1.5</Radius>
                            <Fill>
                                <CssParameter name="fill">#FFFFFF</CssParameter>
                            </Fill>
                        </Halo>
                        <ogc:Geometry>
                            <ogc:Function name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </ogc:Geometry>
                        <LabelPlacement>
                            <PointPlacement>
                                <AnchorPoint>
                                    <AnchorPointX>0</AnchorPointX>
                                    <AnchorPointY>0</AnchorPointY>
                                </AnchorPoint>
                            </PointPlacement>
                        </LabelPlacement>
                    </TextSymbolizer>
                </Rule>
                <Rule>
                    <Title>Asia</Title>
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>continent</ogc:PropertyName>
                            <ogc:Literal>Asia</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                    </ogc:Filter>
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#a21caf</CssParameter>
                            <CssParameter name="fill-opacity">0.1</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#a21caf</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">Serif.plain</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                            <CssParameter name="font-style">bold</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#a21caf</CssParameter>
                        </Fill>
                        <Halo>
                            <Radius>1.5</Radius>
                            <Fill>
                                <CssParameter name="fill">#FFFFFF</CssParameter>
                            </Fill>
                        </Halo>
                        <ogc:Geometry>
                            <ogc:Function name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </ogc:Geometry>
                        <LabelPlacement>
                            <PointPlacement>
                                <AnchorPoint>
                                    <AnchorPointX>0</AnchorPointX>
                                    <AnchorPointY>0</AnchorPointY>
                                </AnchorPoint>
                            </PointPlacement>
                        </LabelPlacement>
                    </TextSymbolizer>
                </Rule>
                <Rule>
                    <Title>Europe</Title>
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>continent</ogc:PropertyName>
                            <ogc:Literal>Europe</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                    </ogc:Filter>
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#374151</CssParameter>
                            <CssParameter name="fill-opacity">0.1</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#374151</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">Serif.plain</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                            <CssParameter name="font-style">bold</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#374151</CssParameter>
                        </Fill>
                        <Halo>
                            <Radius>1.5</Radius>
                            <Fill>
                                <CssParameter name="fill">#FFFFFF</CssParameter>
                            </Fill>
                        </Halo>
                        <ogc:Geometry>
                            <ogc:Function name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </ogc:Geometry>
                        <LabelPlacement>
                            <PointPlacement>
                                <AnchorPoint>
                                    <AnchorPointX>0</AnchorPointX>
                                    <AnchorPointY>0</AnchorPointY>
                                </AnchorPoint>
                            </PointPlacement>
                        </LabelPlacement>
                    </TextSymbolizer>
                </Rule>
                <Rule>
                    <Title>Oceania</Title>
                    <ogc:Filter>
                        <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>continent</ogc:PropertyName>
                            <ogc:Literal>Oceania</ogc:Literal>
                        </ogc:PropertyIsEqualTo>
                    </ogc:Filter>
                    <PolygonSymbolizer>
                        <Fill>
                            <CssParameter name="fill">#be185d</CssParameter>
                            <CssParameter name="fill-opacity">0.1</CssParameter>
                        </Fill>
                        <Stroke>
                            <CssParameter name="stroke">#be185d</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </PolygonSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">Serif.plain</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                            <CssParameter name="font-style">bold</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#be185d</CssParameter>
                        </Fill>
                        <Halo>
                            <Radius>1.5</Radius>
                            <Fill>
                                <CssParameter name="fill">#FFFFFF</CssParameter>
                            </Fill>
                        </Halo>
                        <ogc:Geometry>
                            <ogc:Function name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </ogc:Geometry>
                        <LabelPlacement>
                            <PointPlacement>
                                <AnchorPoint>
                                    <AnchorPointX>0</AnchorPointX>
                                    <AnchorPointY>0</AnchorPointY>
                                </AnchorPoint>
                            </PointPlacement>
                        </LabelPlacement>
                    </TextSymbolizer>
                </Rule>
            </FeatureTypeStyle>
        </UserStyle>
    </NamedLayer>
</StyledLayerDescriptor>