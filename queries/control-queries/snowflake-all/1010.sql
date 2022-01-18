select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,household_demographics hd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 152 and ws.ws_hash <= 485 and d.d_hash >= 523 and d.d_hash <= 923 and hd.hd_hash >= 212 and hd.hd_hash <= 962
;
