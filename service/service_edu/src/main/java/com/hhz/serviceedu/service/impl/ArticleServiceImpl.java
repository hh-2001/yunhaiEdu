package com.hhz.serviceedu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.hhz.serviceedu.entity.Article;
import com.hhz.serviceedu.entity.ArticleDescription;
import com.hhz.serviceedu.entity.vo.ArticleInfoVo;
import com.hhz.serviceedu.mapper.ArticleMapper;
import com.hhz.serviceedu.service.ArticleDescriptionService;
import com.hhz.serviceedu.service.ArticleService;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: hhz
 * @Date: 2023/4/21
 * @Time: 9:29
 * @Description:
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Autowired
    private ArticleDescriptionService articleDescriptionService;

    @Override
    public ArticleInfoVo getArticleDetail(String articleId) {
        //使用精确查询到文章内容
        QueryWrapper<ArticleDescription> wrapper = new QueryWrapper<>();
        wrapper.eq("article_id", articleId);
        ArticleDescription articleDescription = articleDescriptionService.getOne(wrapper);
        //获取基础文章归属内容
        Article article = baseMapper.selectById(articleId);
        //构建文章详情内容
        ArticleInfoVo articleInfoVo = new ArticleInfoVo();
        BeanUtils.copyProperties(article, articleInfoVo);
        articleInfoVo.setArticleDescription(articleDescription.getArticleDescription());
        return articleInfoVo;
    }

    /**
     * 导出为pdf
     * @param articleId
     */
    @Override
    public void exportPdf(String articleId, HttpServletResponse response) {
        ArticleInfoVo articleDetail = getArticleDetail(articleId);
        //构建pdf
        // 生成 pdf 名称
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String str = simpleDateFormat.format(date);
        String datetime = str.replace("-", "").replace(" ", "").replace(":","");
        String filename = "article_"+datetime+"_content.pdf";

        // 创建PDF
        Document document = new Document(PageSize.A4,60,60,15,40);
        try {
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(filename, "UTF-8"));
            //常用的有paragraph段落、phrase语句块、chunk最小单位块
            OutputStream out = response.getOutputStream();
            PdfWriter writer = PdfWriter.getInstance(document, out);

            // 打开文档
            document.open();
            BaseFont bfChinese = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
            for(int n = 0; n<2; n++){
                // 添加文字水印
                PdfContentByte cb = writer.getDirectContent();
                cb.beginText(); // 开始
                // 设置透明度
                PdfGState gs = new PdfGState();
                gs.setFillOpacity(0.2f);
                cb.setGState(gs);
                cb.setFontAndSize(bfChinese,100);
                cb.showTextAligned(Element.ALIGN_CENTER, "yunhaiEdu", 340, 410 , 60);
                cb.endText(); // 结束

                // 添加标题
                //通过Font去设置字体的基本属性：大小，加粗等等
                Font font  = new Font(bfChinese, 15, Font.NORMAL, BaseColor.BLACK);
                // 创建段落
                Paragraph title = new Paragraph(articleDetail.getArticleName(), font);
                title.setAlignment(Element.ALIGN_CENTER);
                title.setSpacingBefore(40f);
                document.add(title);

                // 制作大文本数据
                Font font1  = new Font(bfChinese, 10, Font.NORMAL, BaseColor.BLACK);
                Paragraph context = new Paragraph(articleDetail.getArticleDescription(), font1);
                context.setFirstLineIndent(20);
                context.setLeading(12);
                context.setSpacingBefore(10f);
                document.add(context);

                // 开启新的一页
                document.newPage();
                //显示空内容的页
                writer.setPageEmpty(false);
            }
            // 关闭流
            document.close();
            writer.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }
    }
}

