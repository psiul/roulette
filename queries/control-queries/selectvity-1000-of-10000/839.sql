select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 306 and c.c_hash <= 706 and cd.cd_hash >= 618 and cd.cd_hash <= 951 and i.i_hash >= 208 and i.i_hash <= 958
;
