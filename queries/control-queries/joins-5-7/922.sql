select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 66 and c.c_hash <= 399 and hd.hd_hash >= 443 and hd.hd_hash <= 843 and cd.cd_hash >= 38 and cd.cd_hash <= 788
;
