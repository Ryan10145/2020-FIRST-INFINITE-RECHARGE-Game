// NOTE: All function names here are deliberately shortened in order to increase code readability
// cw - convertWidth
// ch - convertHeight
// cx - convertX
// cy - convertY

// converts ratio of total width to pixels 
public float cw(float ratio) {
    if(topPadding) {
        return width * ratio;
    }
    else {
        float paddingWidth = (width - field.width) / 2;
        return (width - paddingWidth * 2) * ratio;
    }
}

// converts ratio of total height to pixels 
public float ch(float ratio) {
    if(topPadding) {
        float paddingHeight = (height - field.height) / 2;
        return (height - paddingHeight * 2) * ratio;
    }
    else {
        return height * ratio;
    }
}

// converts ratio of total width to pixels while considering padding
public float cx(float ratio) {
    if(topPadding) {
        return width * ratio;
    }
    else {
        float paddingWidth = (width - field.width) / 2;
        return (width - paddingWidth * 2) * ratio + paddingWidth;
    }
}

// converts ratio of total height to pixels while considering padding
public float cy(float ratio) {
    if(topPadding) {
        float paddingHeight = (height - field.height) / 2;
        return (height - paddingHeight * 2) * ratio + paddingHeight;
    }
    else {
        return height * ratio;
    }
}

public float getXRatio(float x) {
    if(topPadding) {
        return x / width;
    }
    else {
        float paddingWidth = (width - field.width) / 2;
        return (x - paddingWidth) / (width - paddingWidth * 2);
    }
}

public float getYRatio(float y) {
    if(topPadding) {
        float paddingHeight = (height - field.height) / 2;
        return (y - paddingHeight) / (height - paddingHeight * 2);
    }
    else {
        return y / height;
    }
}

public float getWRatio(float w) {
    if(topPadding) {
        return w / width;
    }
    else {
        float paddingWidth = (width - field.width) / 2;
        return w / (width - paddingWidth * 2);
    }
}

public float getHRatio(float h) {
    if(topPadding) {
        float paddingHeight = (height - field.height) / 2;
        return h / (height - paddingHeight * 2);
    }
    else {
        return h / height;
    }
}

int pressMouseX = 0, pressMouseY = 0;

void mousePressed() {
    println("Press X: ", getXRatio(mouseX), "Press Y: ", getYRatio(mouseY));
    float d = dist(mouseX, mouseY, pressMouseX, pressMouseY);
    println("Width: ", getWRatio(d), "Height: ", getHRatio(d));
    println("Angle: ", degrees(atan2(pressMouseY - mouseY, mouseX - pressMouseX)) - 90);

    pressMouseX = mouseX;
    pressMouseY = mouseY;
}
