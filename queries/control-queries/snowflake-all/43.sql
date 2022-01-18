select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,item i,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 163 and ws.ws_hash <= 913 and i.i_hash >= 610 and i.i_hash <= 943 and hd.hd_hash >= 285 and hd.hd_hash <= 685
;
