from ultralytics import YOLO

model = YOLO("yolov8n.pt")  # load a pretrained model (recommended for training)

results = model.train(data="coco8.yaml", epochs=100, imgsz=640)
