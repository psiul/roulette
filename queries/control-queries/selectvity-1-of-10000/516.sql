select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 143 and ss.ss_hash <= 163 and i.i_hash >= 620 and i.i_hash <= 670 and hd.hd_hash >= 199 and hd.hd_hash <= 299
;
