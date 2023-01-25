<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0"
    xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd"
    xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <NamedLayer>
        <Name>World Rivers</Name>
        <UserStyle>
            <Title>World Rivers</Title>
            <FeatureTypeStyle>
                <Rule>
                    <Name>World Rivers</Name>
                    <Title>World Rivers</Title>
                    <MinScaleDenominator>2500000</MinScaleDenominator>
                    <VendorOption name="inclusion">mapOnly</VendorOption>
                    <LineSymbolizer>
                        <Stroke>
                            <!--Here is the blue line stroke with the width of 1 pixel-->
                            <CssParameter name="stroke">#3b82f6</CssParameter>
                            <CssParameter name="stroke-width">1</CssParameter>
                        </Stroke>
                    </LineSymbolizer>
                </Rule>
                <Rule>
                    <Name>World Rivers</Name>
                    <Title>World Rivers</Title>
                    <MinScaleDenominator>1</MinScaleDenominator>
                    <MaxScaleDenominator>2499999</MaxScaleDenominator>
                    <LineSymbolizer>
                        <Stroke>
                            <CssParameter name="stroke">#1e40af</CssParameter>
                            <CssParameter name="stroke-width">4</CssParameter>
                        </Stroke>
                    </LineSymbolizer>
                    <TextSymbolizer>
                        <Label>
                            <ogc:PropertyName>river_map</ogc:PropertyName>
                        </Label>
                        <LabelPlacement>
                            <LinePlacement>
                                <PerpendicularOffset>15</PerpendicularOffset>
                            </LinePlacement>
                        </LabelPlacement>
                        <Fill>
                            <CssParameter name="fill">#1e40af</CssParameter>
                        </Fill>
                        <Font>
                            <CssParameter name="font-family">serif</CssParameter>
                            <CssParameter name="font-size">16</CssParameter>
                        </Font>
                        <VendorOption name="followLine">true</VendorOption>
                        <VendorOption name="maxAngleDelta">30</VendorOption>
                        <VendorOption name="maxDisplacement">200</VendorOption>
                        <VendorOption name="repeat">150</VendorOption>
                    </TextSymbolizer>
                </Rule>
            </FeatureTypeStyle>
        </UserStyle>
    </NamedLayer>
</StyledLayerDescriptor>