#!/bin/sh

#  Script.sh
#  ABC
#
#  Created by 葛高召 on 2022/1/6.
#  Copyright © 2022 葛高召. All rights reserved.

echo ///                        ///
echo /// 🚀开始延迟编译二进制库🚀  ///
echo ///                       ///

read_dir() {
    for file in `ls $1`
    do
    if [ -d $1"/"$file ]
    then
    read_dir $1"/"$file
    else
    echo $1"/"$file
    fi
    done
}

echo ======😂😂😂目录信息😂😂😂=========
CURRENT_DIR1=$(cd `dirname $0`; pwd)
read_dir $CURRENT_DIR1
echo ======😂😂😂目录信息😂😂😂=========

#workspace名、scheme名字
PROJECT_NAME='UsualTool'
BINARY_NAME="${PROJECT_NAME}"

#进入工程根目录
cd Example

#framework路径
INSTALL_DIR=../PodProducts
if [ -d ${INSTALL_DIR} ];then
    echo "移除framework缓存  $INSTALL_DIR"
    rm -rf ${INSTALL_DIR}
else
    echo "创建framework路径  $INSTALL_DIR"
    mkdir -p $INSTALL_DIR
fi

#编译场地
BUILD_PATH="${CURRENT_DIR1}/build"
RE_OS="Release-iphoneos"
RE_SIMULATOR="Release-iphonesimulator"
DEVICE_DIR_FOLDER="${BUILD_PATH}/${RE_OS}"
SIMULATOR_DIR_FOLDER="${BUILD_PATH}/${RE_SIMULATOR}"
DEVICE_DIR="${DEVICE_DIR_FOLDER}/${BINARY_NAME}.framework"
SIMULATOR_DIR="${SIMULATOR_DIR_FOLDER}/${BINARY_NAME}.framework"
echo ======😂😂😂编译场地信息😂😂😂=========
CURRENT_DIR2=$(cd `dirname $0`; pwd)
echo "CURRENT_DIR: ${CURRENT_DIR2}"
echo "BUILD_PATH: ${BUILD_PATH}"
echo "DEVICE_DIR_FOLDER: ${DEVICE_DIR_FOLDER}"
echo "SIMULATOR_DIR_FOLDER: ${SIMULATOR_DIR_FOLDER}"
echo "DEVICE_DIR: ${DEVICE_DIR}"
echo "SIMULATOR_DIR: ${SIMULATOR_DIR}"
echo ======😂😂😂编译场地信息😂😂😂=========

#分别编译模拟器和真机的Framework
xcodebuild -configuration "Release" -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${BINARY_NAME}" ONLY_ACTIVE_ARCH=NO MACH_O_TYPE="staticlib" -sdk iphoneos CONFIGURATION_BUILD_DIR="${DEVICE_DIR_FOLDER}" clean build
xcodebuild -configuration "Release" -workspace "${PROJECT_NAME}.xcworkspace" -scheme "${BINARY_NAME}" ONLY_ACTIVE_ARCH=NO MACH_O_TYPE="staticlib" ARCHS='i386 x86_64' VALID_ARCHS='i386 x86_64' -sdk iphonesimulator CONFIGURATION_BUILD_DIR="${SIMULATOR_DIR_FOLDER}" clean build

echo ======😂😂😂目录信息😂😂😂=========
read_dir ../
echo ======😂😂😂目录信息😂😂😂=========

if [ -d "${DEVICE_DIR}/" ];then
    echo "exist ${DEVICE_DIR}"
else
    echo "termination | reason: not exist ${DEVICE_DIR}"
    exit
fi

if [ -d "${SIMULATOR_DIR}/" ];then
    echo "exist ${SIMULATOR_DIR}"
else
    echo "termination | reason: not exist ${SIMULATOR_DIR}"
    exit
fi

#合成fat库
INSTALL_LIB_DIR=${INSTALL_DIR}/${BINARY_NAME}.framework
if [ -d "${INSTALL_LIB_DIR}" ]
then
rm -rf "${INSTALL_LIB_DIR}"
fi
mkdir -p "${INSTALL_LIB_DIR}"
cp -a "${DEVICE_DIR}/" "${INSTALL_LIB_DIR}/"
lipo -create "${DEVICE_DIR}/${BINARY_NAME}" "${SIMULATOR_DIR}/${BINARY_NAME}" -output "${INSTALL_LIB_DIR}/${BINARY_NAME}"

#删除编译产物
rm -rf $BUILD_PATH

echo ///                        ///
echo /// 🚀完成延迟编译二进制库🚀  ///
echo ///                       ///
