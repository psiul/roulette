select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,item i,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 433 and hd.hd_hash <= 833 and i.i_hash >= 127 and i.i_hash <= 877 and cd.cd_hash >= 230 and cd.cd_hash <= 563
;
