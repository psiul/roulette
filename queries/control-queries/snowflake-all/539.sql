select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 209 and ws.ws_hash <= 609 and hd.hd_hash >= 167 and hd.hd_hash <= 917 and i.i_hash >= 534 and i.i_hash <= 867
;
