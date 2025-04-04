import cv2
import os

def process_image(image_path):
    img = cv2.imread(image_path)
    if img is None:
        return "Image not found"

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    out_path = "/data/user/0/com.example.my_app/files/processed.png"
    cv2.imwrite(out_path, gray)
    return out_path