select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,warehouse w,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 661 and d.d_hash <= 994 and i.i_hash >= 532 and i.i_hash <= 932 and hd.hd_hash >= 13 and hd.hd_hash <= 763
;
