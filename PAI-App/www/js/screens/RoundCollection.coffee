class RoundCollection
    constructor: () ->
        @list = []
        @current_index = 0

        console.log("constructor : @current_index: #{@current_index}")

    add: (item) =>
        @list.push(item)

    next: () =>
        @current_index += 1
        if @current_index >= @list.length
            @current_index = 0

        console.log("next() : @current_index: #{@current_index}")

        return @list[@current_index]

    prev: () =>
        @current_index -= 
        if @current_index < 0
            @current_index = @list.length - 1

        console.log("prev() : @current_index: #{@current_index}")

        return @list[@current_index]

    current: () =>
        return @list[@current_index]        

module.exports = RoundCollection