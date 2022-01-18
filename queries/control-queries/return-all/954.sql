select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,household_demographics hd,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 136 and ws.ws_hash <= 886 and hd.hd_hash >= 246 and hd.hd_hash <= 646 and d.d_hash >= 457 and d.d_hash <= 790
;
