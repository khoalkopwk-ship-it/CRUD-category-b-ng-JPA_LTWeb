package vn.iotstar.utils;

import java.io.File;
import java.io.IOException;
import java.util.Set;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public final class ImageUtil {

    private static final Set<String> ALLOWED_EXTENSIONS =
            Set.of(".jpg", ".jpeg", ".png", ".gif", ".webp");

    private ImageUtil() {
    }

    public static String saveCategoryIcon(ServletContext context, Part part)
            throws IOException {
        if (part == null || part.getSize() == 0
                || part.getSubmittedFileName() == null
                || part.getSubmittedFileName().isBlank()) {
            return null;
        }

        String originalName = new File(part.getSubmittedFileName()).getName();
        int dotIndex = originalName.lastIndexOf('.');
        String extension = dotIndex >= 0
                ? originalName.substring(dotIndex).toLowerCase()
                : "";

        if (!ALLOWED_EXTENSIONS.contains(extension)) {
            throw new IllegalArgumentException("Chỉ chấp nhận ảnh JPG, PNG, GIF hoặc WEBP");
        }

        String realPath = context.getRealPath("/images/category");
        if (realPath == null) {
            throw new IOException("Tomcat không cung cấp đường dẫn lưu ảnh thực tế");
        }

        File uploadDirectory = new File(realPath);
        if (!uploadDirectory.exists() && !uploadDirectory.mkdirs()) {
            throw new IOException("Không thể tạo thư mục lưu ảnh: " + realPath);
        }

        String fileName = UUID.randomUUID() + extension;
        part.write(new File(uploadDirectory, fileName).getAbsolutePath());
        return "category/" + fileName;
    }
}
