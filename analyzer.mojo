from std.python import Python
from std.python.numpy import copy_to_numpy_array

def calculate_average(temps: List[Float64]) raises -> Float64:
    if len(temps) == 0:
        raise Error("No temperature data")

    # A literal with a decimal component defaults to Float64
    var total = 0.0
    for temp in temps:
        total += temp
    return total / Float64(len(temps))


def main():
    print("Temperature Analyzer")

    # [Float64] sets the List element type at compile time
    var temps: List[Float64] = [20.5, 22.3, 19.8, 25.1]

    print("Recorded", len(temps), "temperatures")

    for index in range(len(temps)):  # The range is [0, len(temps))
        print(t"    Day {index + 1}: {temps[index]}°C")

    try:
        var avg = calculate_average(temps)
        print(t"Average: {round(avg, 2)}°C")

        if avg > 25.0:
            print("Status: Hot week")
        elif avg > 20.0:
            print("Status: Comfortable week")
        else:
            print("Status: Cool week")

        var np = Python.import_module("numpy")
        var pytemps = copy_to_numpy_array(temps)
        var std_dev = np.std(pytemps)
        print("Temperature standard deviation:", std_dev)
    except e:
        print("Error:", e)
