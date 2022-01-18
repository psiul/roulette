select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 497 and i.i_hash <= 897 and c.c_hash >= 72 and c.c_hash <= 405 and cd.cd_hash >= 163 and cd.cd_hash <= 913
;
