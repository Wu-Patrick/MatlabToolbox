# 保存tif文件函数
import gdal
import numpy as np
import argparse

print('''****************************************
Copyright:    WZP
Filename:     imwriteTiffComplex.exe
Description:  Combine two real-valued tiff files and save them as a complex-valued tiff file.

@author:      wuzhipeng
@email:       763008300@qq.com
@website:     https://wuzhipeng.cn/
@create on:   6/20/2021 6:04 PM
@software:    
****************************************
''')

parser = argparse.ArgumentParser('imwriteTiffComplex.exe')
parser.add_argument('-r','--real', type=str,help='tif file of real',required=True)
parser.add_argument('-i','--imag',type=str,help='tif file of imag',required=True)
parser.add_argument('-o','--out',type=str,help='tif file of out',required=True)
args = parser.parse_args()



datasetReal = gdal.Open(args.real)
if datasetReal == None:
    print(args.real + " cannot open!")
real_width = datasetReal.RasterXSize  # 栅格矩阵的列数
real_height = datasetReal.RasterYSize  # 栅格矩阵的行数
real_bands = datasetReal.RasterCount  # 波段数
real_data = datasetReal.ReadAsArray(0, 0, real_width, real_height)  # 获取数据
real_geotrans = datasetReal.GetGeoTransform()  # 获取仿射矩阵信息
real_proj = datasetReal.GetProjection()  # 获取投影信息

datasetImag = gdal.Open(args.imag)
if datasetImag == None:
    print(args.imag + " cannot open!")
imag_width = datasetImag.RasterXSize  # 栅格矩阵的列数
imag_height = datasetImag.RasterYSize  # 栅格矩阵的行数
imag_bands = datasetImag.RasterCount  # 波段数
imag_data = datasetImag.ReadAsArray(0, 0, imag_width, imag_height)  # 获取数据
imag_geotrans = datasetImag.GetGeoTransform()  # 获取仿射矩阵信息
imag_proj = datasetImag.GetProjection()  # 获取投影信息

assert real_width==imag_width and real_height==imag_height and real_bands==imag_bands

driver = gdal.GetDriverByName("GTiff")
datasetOut = driver.Create(args.out, real_width, real_height, real_bands, gdal.GDT_CFloat32)
datasetOut.SetGeoTransform(real_geotrans)  # 写入仿射变换参数
datasetOut.SetProjection(real_proj)  # 写入投影
datasetOut.GetRasterBand(1).WriteArray(real_data+1j*imag_data)
del datasetOut