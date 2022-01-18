select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 606 and cd.cd_hash <= 939 and i.i_hash >= 49 and i.i_hash <= 449 and hd.hd_hash >= 159 and hd.hd_hash <= 909
;
