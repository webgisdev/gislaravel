<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
    xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd"
    xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <NamedLayer>
        <Name>Monuments</Name>
        <UserStyle>
            <Title>Monuments</Title>
            <FeatureTypeStyle>
                <Rule>
                    <Title>Monuments</Title>
                    <PointSymbolizer>
                        <Graphic>
                            <Mark>
                                <WellKnownName>Circle</WellKnownName>
                                <Fill>
                                    <CssParameter name="fill">#00FFFF</CssParameter>
                                </Fill>
                                <Stroke>
                                    <CssParameter name="stroke">#C0C0C0</CssParameter>
                                    <CssParameter name="stroke-width">2</CssParameter>
                                </Stroke>
                            </Mark>
                            <Size>8</Size>
                        </Graphic>
                    </PointSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>name</ogc:PropertyName>
                        </Label>
                        <Font>
                            <CssParameter name="font-family">SansSerif.plain</CssParameter>
                            <CssParameter name="font-size">10</CssParameter>
                        </Font>
                        <Fill>
                            <CssParameter name="fill">#000000</CssParameter>
                        </Fill>
                        <LabelPlacement>
                            <PointPlacement>
                                <Displacement>
                                    <DisplacementX> 8 </DisplacementX>
                                    <DisplacementY> 18 </DisplacementY>
                                </Displacement>
                            </PointPlacement>
                        </LabelPlacement>
                        <Graphic>
                            <Mark>
                                <WellKnownName>Square</WellKnownName>
                                <Fill>
                                    <CssParameter name="fill">#FFFFFF</CssParameter>
                                    <CssParameter name="fill-opacity">0.5</CssParameter>
                                </Fill>
                                <Stroke>
                                    <CssParameter name="stroke">#E3E3E3</CssParameter>
                                    <CssParameter name="stroke-width">2</CssParameter>
                                </Stroke>
                                <Size>10</Size>
                            </Mark>
                        </Graphic>
                        <VendorOption name="graphic-resize">stretch</VendorOption>
                        <VendorOption name="graphic-margin">4</VendorOption>
                    </TextSymbolizer>
                </Rule>
            </FeatureTypeStyle>
        </UserStyle>
    </NamedLayer>
</StyledLayerDescriptor>