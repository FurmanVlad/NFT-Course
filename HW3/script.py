print("Lets calculate the area of a rectangle")
print("Please enter the length of the rectangle:")
length = float(input())
print("Please enter the width of the rectangle:")
width = float(input())
area = length * width
print("The area of the rectangle is: {length} * {width} = {area}".format(length=length, width=width, area=area))
print("Thank you for using the area calculator!")