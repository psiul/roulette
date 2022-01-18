select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,household_demographics hd,item i,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 65 and ws.ws_hash <= 398 and hd.hd_hash >= 436 and hd.hd_hash <= 836 and i.i_hash >= 219 and i.i_hash <= 969
;
