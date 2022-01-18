select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 142 and cd.cd_hash <= 242 and c.c_hash >= 394 and c.c_hash <= 594 and i.i_hash >= 888 and i.i_hash <= 938
;
