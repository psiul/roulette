select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,item i,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 197 and ws.ws_hash <= 597 and hd.hd_hash >= 176 and hd.hd_hash <= 926 and d.d_hash >= 508 and d.d_hash <= 841
;
