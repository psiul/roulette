select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and cd.cd_hash >= 7 and cd.cd_hash <= 407 and i.i_hash >= 633 and i.i_hash <= 966
;
