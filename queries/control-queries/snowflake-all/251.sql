select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,customer_demographics cd,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 88 and ws.ws_hash <= 838 and hd.hd_hash >= 5 and hd.hd_hash <= 338 and i.i_hash >= 357 and i.i_hash <= 757
;
