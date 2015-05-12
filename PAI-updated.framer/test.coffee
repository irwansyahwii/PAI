images = [
    '/imported/PAI-updated/images/Intro 1.png'
    , '/imported/PAI-updated/images/Intro 2.png'
    , '/imported/PAI-updated/images/Intro 3.png'
    , '/imported/PAI-updated/images/Intro 4.png'
]

introLayers = []

for image in images
    layerIntro = new Layer
        x: 0
        y: 0
        width:1024
        height:600
        image: image
        opacity: 0

    layerIntro.states.add
        fadein: {opacity: 1}
        fadeout: {opacity: 0}

    # layerIntro.states.animationOptions = 
    #     curve: "spring(600,30,0)"

    layerIntro.center()

    introLayers.push(layerIntro)

currentLayerIndex = 0
isStart = true

fades = () =>
    console.log(currentLayerIndex)
    if currentLayerIndex > 0
        introLayers[currentLayerIndex-1].states.switch("fadeout");
    else
        if isStart
            isStart = false
        else
            introLayers[introLayers.length - 1].states.switch("fadeout");

    introLayers[currentLayerIndex].states.switch("fadein");
    currentLayerIndex += 1
    if currentLayerIndex >= introLayers.length
        currentLayerIndex = 0
    setTimeout(
            () =>
                fades()
        , 5000)

fades()
