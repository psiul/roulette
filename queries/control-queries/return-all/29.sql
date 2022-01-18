select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,household_demographics hd,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 480 and ws.ws_hash <= 813 and hd.hd_hash >= 84 and hd.hd_hash <= 484 and i.i_hash >= 82 and i.i_hash <= 832
;
