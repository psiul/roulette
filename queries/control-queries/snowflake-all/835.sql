select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,household_demographics hd,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 105 and ws.ws_hash <= 505 and i.i_hash >= 60 and i.i_hash <= 810 and hd.hd_hash >= 133 and hd.hd_hash <= 466
;
