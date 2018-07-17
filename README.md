# MinVolEllipse
Translate the MinVolEllipse function to R language

Original function is written and shared by Nima Moshtagh at University of Pennsylvania:

https://www.mathworks.com/matlabcentral/fileexchange/9542-minimum-volume-enclosing-ellipsoid

It finds the minimum volume enclosing ellipsoid for a set of data points

# Example

See the Rmd file for further information

```r
source("MinVolEllipse.r")
mve = MinVolEllipse(t(df),0.01)
print(mve$center)
print(mve$matrix)
```
