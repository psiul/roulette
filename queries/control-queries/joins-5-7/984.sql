select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 163 and i.i_hash <= 913 and hd.hd_hash >= 262 and hd.hd_hash <= 595 and cd.cd_hash >= 202 and cd.cd_hash <= 602
;
