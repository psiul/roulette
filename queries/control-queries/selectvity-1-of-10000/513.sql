select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 169 and ss.ss_hash <= 219 and i.i_hash >= 104 and i.i_hash <= 124 and cd.cd_hash >= 830 and cd.cd_hash <= 930
;
