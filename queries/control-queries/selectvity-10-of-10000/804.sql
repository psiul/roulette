select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 843 and ss.ss_hash <= 893 and hd.hd_hash >= 305 and hd.hd_hash <= 505 and cd.cd_hash >= 29 and cd.cd_hash <= 129
;
