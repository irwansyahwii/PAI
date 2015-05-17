class ClickEffect
    @addTo: (layer) =>
        layer.on Events.TouchStart, (event, layer) =>
            layer.scale = 0.9

        layer.on Events.TouchEnd, (event, layer) =>
            layer.scale = 1

module.exports = ClickEffect