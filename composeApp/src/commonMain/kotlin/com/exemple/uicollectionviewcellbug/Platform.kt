package com.exemple.uicollectionviewcellbug

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform