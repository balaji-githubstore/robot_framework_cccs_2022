def img_comp(img1,img2):
    with open(img1,"rb") as img1:
        with open(img2,"rb") as img2:
            if (img1.read())==(img2.read()):
                return True
            else:
                return False