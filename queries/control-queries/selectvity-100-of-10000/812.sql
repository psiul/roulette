select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 300 and hd.hd_hash <= 800 and i.i_hash >= 777 and i.i_hash <= 977 and cd.cd_hash >= 540 and cd.cd_hash <= 640
;
