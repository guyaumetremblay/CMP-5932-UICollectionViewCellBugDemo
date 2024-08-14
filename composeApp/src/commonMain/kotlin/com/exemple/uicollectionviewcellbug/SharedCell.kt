package com.exemple.uicollectionviewcellbug

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Card
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun SharedCell() {
    Card(
        modifier = Modifier
            .padding(horizontal = 20.dp)
            .padding(top = 25.dp)
            .fillMaxWidth(),
        border = BorderStroke(1.dp, MaterialTheme.colors.primary),
        shape = MaterialTheme.shapes.medium,
        elevation = 0.dp
    ) {
        Text(
            modifier = Modifier.padding(16.dp),
            text = "Compose Cell"
        )
    }
}
