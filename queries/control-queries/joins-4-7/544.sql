select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 44 and hd.hd_hash <= 377 and c.c_hash >= 550 and c.c_hash <= 950 and cd.cd_hash >= 145 and cd.cd_hash <= 895
;
