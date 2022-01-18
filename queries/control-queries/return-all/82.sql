select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,warehouse w,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 19 and ws.ws_hash <= 419 and hd.hd_hash >= 434 and hd.hd_hash <= 767 and i.i_hash >= 209 and i.i_hash <= 959
;
