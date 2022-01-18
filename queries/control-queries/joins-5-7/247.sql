select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 647 and ss.ss_hash <= 980 and c.c_hash >= 328 and c.c_hash <= 728 and cd.cd_hash >= 72 and cd.cd_hash <= 822
;
