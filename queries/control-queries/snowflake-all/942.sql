select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,household_demographics hd,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 1 and ws.ws_hash <= 751 and d.d_hash >= 387 and d.d_hash <= 720 and hd.hd_hash >= 479 and hd.hd_hash <= 879
;
