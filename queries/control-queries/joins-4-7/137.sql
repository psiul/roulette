select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 169 and ss.ss_hash <= 919 and cd.cd_hash >= 383 and cd.cd_hash <= 783 and i.i_hash >= 464 and i.i_hash <= 797
;
