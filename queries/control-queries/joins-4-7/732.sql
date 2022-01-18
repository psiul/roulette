select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 619 and cd.cd_hash <= 952 and hd.hd_hash >= 481 and hd.hd_hash <= 881 and i.i_hash >= 65 and i.i_hash <= 815
;
