def say_hello(n):
    tmp = []
    for i in range(1,n+1):
        #print("{} Hello!!!".format(n))
        tmp.append("{} Hello!!!".format(i))
        #print(tmp)

    #dump_list2stdout(tmp)
    return tmp

        
def dump_list2stdout(list):
    for i in list:
        print i
        

if __name__ == "__main__":
    print("hello.py is being run directly")
    say_hello(5)
