select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,item i,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 96 and ws.ws_hash <= 846 and i.i_hash >= 413 and i.i_hash <= 813 and hd.hd_hash >= 233 and hd.hd_hash <= 566
;
