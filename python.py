# dictionary with list as values
vals = dict()
key = 'something' #key cannot be list only hashable data types can be used as key
new_val = 'something'
if key in vals.keys():
    vals[key].append(new_val)
else:
    vals[key]  = [new_val] 

# String manipulation
s ="abc"
s[i] = s #not allowed 