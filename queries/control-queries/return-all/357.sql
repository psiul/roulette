select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 394 and ss.ss_hash <= 727 and hd.hd_hash >= 422 and hd.hd_hash <= 822 and cd.cd_hash >= 242 and cd.cd_hash <= 992
;
