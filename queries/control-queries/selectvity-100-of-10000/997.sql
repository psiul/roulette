select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 456 and ss.ss_hash <= 656 and hd.hd_hash >= 156 and hd.hd_hash <= 256 and cd.cd_hash >= 445 and cd.cd_hash <= 945
;
